/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import { Router } from 'express'

import { asyncMiddleware } from '../../middleware/util.js'
import { breachDetailPage } from '../../controllers/pages/breachDetail.js'

const router = Router()

router.get('/:breachName', asyncMiddleware(breachDetailPage))

export default router
