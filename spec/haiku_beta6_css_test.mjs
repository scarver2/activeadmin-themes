// spec/haiku_beta6_css_test.mjs
import assert from "node:assert/strict";
import { createHash } from "node:crypto";
import { readFileSync } from "node:fs";
import test from "node:test";

import postcss from "postcss";

const root = new URL("../lib/active_admin/themes/recipes/haiku_beta6/", import.meta.url);
const parts = [
  "foundation/tokens",
  "foundation/base",
  "components/navigation",
  "components/launchers",
  "components/windows",
  "components/data",
  "components/forms",
  "surfaces/workspace",
  "hardening/responsive",
  "hardening/preferences",
];
const source = parts.map((part) => readFileSync(new URL(`${part}.css`, root), "utf8")).join("\n");

test("Haiku beta6 concerns form valid PostCSS in explicit manifest order", () => {
  const result = postcss().process(source, { from: undefined });
  const selectors = [];
  result.root.walkRules((rule) => selectors.push(rule.selector));

  assert.deepEqual(result.warnings(), []);
  assert.match(selectors[0], /data-activeadmin-theme="haiku_beta6"/);
  assert.ok(selectors.includes('body[data-activeadmin-theme="haiku_beta6"] .haiku-beta6-workspace'));
  assert.ok(selectors.some((selector) => selector.includes(".haiku-beta6-data-table")));
  assert.ok(selectors.some((selector) => selector.includes(".haiku-beta6-primary-action")));
});

test("Haiku beta6 keeps every selector scoped to its theme or preference context", () => {
  const tree = postcss.parse(source);

  tree.walkRules((rule) => {
    assert.match(rule.selector, /body\[data-activeadmin-theme="haiku_beta6"\]/);
  });
});

test("Haiku beta6 does not mutate the accepted AROS/Zune recipe bytes", () => {
  const arosZune = new URL("../lib/active_admin/themes/recipes/aros_zune/", import.meta.url);
  const arosZuneSource = parts.map((part) => readFileSync(new URL(`${part}.css`, arosZune), "utf8")).join("\n");
  const digest = createHash("sha256").update(arosZuneSource).digest("hex");

  assert.equal(digest, "8dd28a338ad65686f80aacaf088c972d53ea17bb1e6defbf18b756d895f23baf");
  assert.doesNotMatch(arosZuneSource, /body\[data-activeadmin-theme="haiku_beta6"\]/);
});
