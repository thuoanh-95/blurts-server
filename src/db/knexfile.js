/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import pgConnectionStr from 'pg-connection-string'

import AppConstants from '../appConstants.js'
const { DATABASE_URL, NODE_ENV } = AppConstants
const connectionObj = pgConnectionStr.parse(DATABASE_URL)
if (NODE_ENV === 'heroku') {
  // @ts-ignore TODO: Check if this typing error is correct, or if the types are wrong?
  connectionObj.ssl = { rejectUnauthorized: false }
}

// For runtime, use DATABASE_URL
const RUNTIME_CONFIG = {
  client: 'postgresql',
  connection: connectionObj
}

// For tests, use test-DATABASE
const testConnectionObj = pgConnectionStr.parse(DATABASE_URL.replace(/\/(\w*)$/, '/test-$1'))
const TESTS_CONFIG = {
  client: 'postgresql',
  connection: testConnectionObj
}

let defaultConfig = {}
if (NODE_ENV === 'tests') {
  defaultConfig = TESTS_CONFIG
} else {
  defaultConfig = RUNTIME_CONFIG
}

export default defaultConfig
