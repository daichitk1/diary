import assert from "node:assert/strict"
import { readFileSync } from "node:fs"
import test from "node:test"
import vm from "node:vm"

const source = readFileSync(new URL("../../app/javascript/application.js", import.meta.url), "utf8")

test("optional controls and repeated Turbo navigation keep one delegated handler", () => {
  assert.match(source, /^import "@hotwired\/turbo-rails"$/m)
  const listeners = new Map()
  const document = {
    body: { style: {} },
    addEventListener(name, handler) {
      listeners.set(name, [...(listeners.get(name) || []), handler])
    }
  }
  vm.runInNewContext(source.replace(/^import "@hotwired\/turbo-rails"$/m, ""), {
    document
  })
  const dispatch = (name, target = {}) => {
    for (const handler of listeners.get(name) || []) handler({ target })
  }
  dispatch("input")
  dispatch("click")
  dispatch("turbo:load")
  dispatch("turbo:load")
  assert.equal(listeners.get("input").length, 1)
  assert.equal(listeners.has("click"), false)
  dispatch("input", { matches: (selector) => selector === "#colorPicker", value: "#123456" })
  assert.equal(document.body.style.backgroundColor, "#123456")
  assert.equal(listeners.size, 1)
})


test("layout loads application only through import maps", () => {
  const layout = readFileSync(new URL("../../app/views/layouts/application.html.erb", import.meta.url), "utf8")
  assert.match(layout, /javascript_importmap_tags/)
  assert.doesNotMatch(layout, /javascript_include_tag\s+["']application["']/)
})
