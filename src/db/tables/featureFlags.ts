/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import createDbConnection from "../connect.js";
import { logger } from "../../app/functions/server/logging";
import { FeatureFlagRow } from "knex/types/tables";

const knex = createDbConnection();

/** @deprecated This type should not be used */
export type FeatureFlag = {
  name: string;
  isEnabled: boolean;
  description?: string;
  dependencies?: string[];
  allowList?: string[];
  waitList?: string[];
  expiredAt?: Date;
  deletedAt?: Date;
  owner?: string;
};

/** @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments */
export async function getAllFeatureFlags() {
  return await knex("feature_flags")
    .whereNull("deleted_at")
    .orderBy("name")
    .returning("*");
}

/** @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments */
export async function getDeletedFeatureFlags() {
  return await knex("feature_flags")
    .whereNotNull("deleted_at")
    .orderBy("name")
    .returning("*");
}

/** @deprecated The method type not be used */
export type FeatureFlagName =
  | "RedesignedEmails"
  | "UpdatedEmailPreferencesOption"
  | "MonthlyActivityEmail"
  | "CancellationFlow"
  | "ConfirmCancellation"
  | "FirstDataBrokerRemovalFixedEmail"
  | "DiscountCouponNextThreeMonths"
  | "LatestScanDateCsatSurvey"
  | "AutomaticRemovalCsatSurvey"
  | "HowItWorksPage"
  | "AdditionalRemovalStatuses";

/**
 * @param options
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function getEnabledFeatureFlags(
  options:
    | { ignoreAllowlist?: false; email: string }
    | { ignoreAllowlist: true },
): Promise<FeatureFlagName[]> {
  let query = knex("feature_flags")
    .select("name")
    .where("deleted_at", null)
    .and.where("expired_at", null)
    .and.where("is_enabled", true);

  if (!options.ignoreAllowlist) {
    query = query.and
      .whereRaw("ARRAY_LENGTH(allow_list, 1) IS NULL")
      .orWhereRaw("? = ANY(allow_list)", options.email);
  }

  const enabledFlagNames = await query;

  return enabledFlagNames.map(
    (row: { name: string }) => row.name as FeatureFlagName,
  );
}

export async function getFeatureFlagByName(name: string) {
  logger.info("getFeatureFlagByName", name);
  const res = await knex("feature_flags").where("name", name);

  return res[0] || null;
}

/**
 * @param flag
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function addFeatureFlag(flag: FeatureFlag) {
  logger.info("addFeatureFlag", flag);
  const featureFlagDb: FeatureFlagRow = {
    name: flag.name,
    is_enabled: flag.isEnabled,
    description: flag.description,
    dependencies: flag.dependencies,
    allow_list: flag.allowList?.reduce((acc: string[], e: string) => {
      e = e.trim();
      if (e) acc.push(e);
      return acc;
    }, []),
    wait_list: flag.waitList?.reduce((acc: string[], e: string) => {
      e = e.trim();
      if (e) acc.push(e);
      return acc;
    }, []),
    expired_at: flag.expiredAt,
    owner: flag.owner,
  };
  const res = await knex("feature_flags")
    .insert(featureFlagDb)
    .onConflict("name")
    .merge(["deleted_at"])
    .returning("*");

  return res[0];
}

/**
 * @param name
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function deleteFeatureFlagByName(name: string) {
  logger.info("deleteFeatureFlagByName", name);
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      deleted_at: knex.fn.now(),
    })
    .returning("*");
  return res[0];
}

/**
 * @param name
 * @param dependencies
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function updateDependencies(name: string, dependencies: string[]) {
  logger.info("updateDependencies", { name, dependencies });
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      dependencies,
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      modified_at: knex.fn.now(),
    })
    .returning("*");

  return res[0];
}

/**
 * @param name
 * @param owner
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function updateOwner(name: string, owner: string) {
  logger.info("updateOwner", { name, owner });
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      owner: owner,
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      modified_at: knex.fn.now(),
    })
    .returning("*");

  return res[0];
}

/**
 * @param name
 * @param allowList
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function updateAllowList(name: string, allowList: string[]) {
  allowList = allowList.reduce((acc: string[], e: string) => {
    e = e.trim();
    if (e) acc.push(e);
    return acc;
  }, []);
  logger.info("updateAllowList", { name, allowList });
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      allow_list: allowList,
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      modified_at: knex.fn.now(),
    })
    .returning("*");

  return res[0];
}

/**
 * @param name
 * @param waitList
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function updateWaitList(name: string, waitList: string[]) {
  waitList = waitList.reduce((acc: string[], e: string) => {
    e = e.trim();
    if (e) acc.push(e);
    return acc;
  }, []);
  logger.info("updateWaitList", { name, waitList });
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      wait_list: waitList,
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      modified_at: knex.fn.now(),
    })
    .returning("*");

  return res[0];
}

/**
 * @param name
 * @param isEnabled
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function enableFeatureFlagByName(
  name: string,
  isEnabled: boolean,
) {
  logger.info("enableFeatureFlagByName", name);
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      is_enabled: isEnabled,
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      modified_at: knex.fn.now(),
    })
    .returning("*");

  return res[0];
}

/**
 * @param name
 * @deprecated The method should not be used, use Nimbus experiment or roll-out: /src/app/functions/server/getExperiments
 */
export async function disableFeatureFlagByName(name: string) {
  logger.info("disableFeatureFlagByName", name);
  const res = await knex("feature_flags")
    .where("name", name)
    .update({
      is_enabled: false,
      // @ts-ignore knex.fn.now() results in it being set to a date,
      // even if it's not typed as a JS date object:
      modified_at: knex.fn.now(),
    })
    .returning("*");

  return res[0];
}
