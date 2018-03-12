// Workaround for browser.setValue begin too fast for Elm.

function sendKeys(selector, text) {
  browser.clearElement(selector);
  for (let i = 0; i < text.length; i++) {
    browser.addValue(selector, text[i])
  }
}

browser.sendKeys = sendKeys;

module.exports = browser;
