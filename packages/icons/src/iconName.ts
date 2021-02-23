/*
 * Copyright 2018 Palantir Technologies, Inc. All rights reserved.
 */

import * as IconNames from "./generated/iconNames";
import * as IconNamesHipa from "./generated/iconNames-hipa";

/** String literal union type of all Blueprint UI icon names. */
export type IconName = typeof IconNames[keyof typeof IconNames];
export type IconNameHipa = typeof IconNamesHipa[keyof typeof IconNamesHipa];
