/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

"use client";

import { usePathname } from "next/navigation";
import EventMetricType from "@mozilla/glean/private/metrics/event";
import { useGa } from "./useGa";
import { GleanEvents, useGlean } from "./useGlean";

type RecordParams = {
  action: "string";
} & EventMetricType;

export const useTelemetry = () => {
  const path = usePathname();
  const glean = useGlean();
  const { gtag } = useGa();

  const record = (eventName: keyof GleanEvents, params: RecordParams) => {
    const { action, ...otherParams } = params;

    // Record event via Glean
    // @ts-ignore TODO: Get correct type for action
    glean?.[eventName]?.[action].record({ path, ...otherParams });

    // Record event via GA
    gtag.record({
      type: "event",
      name: eventName,
      params: {
        ...params,
        action,
        page_location: path,
      },
    });
  };

  return {
    record,
  };
};
