let validComment = {
  'userId': 1,
  'songId': 2,
  'groupId': 3,
  'body': 'This is a great song isn\'t it?',
};

function sendKeys(selector, text) {
  browser.clearElement(selector);
  for (let i = 0; i < text.length; i++) {
    browser.addValue(selector, text[i])
  }
}

browser.sendKeys = sendKeys;

describe('Muse App', function() {
  beforeEach(function () {
    browser.url('http://localhost:3000');
  });

  it('should successfully render the root div', async function() {
    expect(browser.isVisible('#root')).toBeTruthy();
  });

  it('should successfully post comment', async function() {
    browser.setValue('input[placeholder="userId"]', validComment.userId);
    browser.setValue('input[placeholder="groupId"]', validComment.groupId);
    browser.setValue('input[placeholder="songId"]', validComment.songId);
    browser.sendKeys('input[placeholder="body"]', validComment.body);
    browser.click('button=Post');

    // wait for userId input to be cleared
    browser.waitForValue('input[placeholder="userId"]', 1000, true);

    const rows = $$('table tr');
    const columns = rows[rows.length-1].$$('td');
    const today = (new Date()).toISOString();
    date = today.substring(0, 10)

    expect(columns.length).toBe(6);
    expect(columns[0].getText()).not.toBe('');
    expect(columns[1].getText().substring(0, 10)).toBe(date);
    expect(columns[2].getText()).toBe(validComment.userId.toString());
    expect(columns[3].getText()).toBe(validComment.groupId.toString());
    expect(columns[4].getText()).toBe(validComment.songId.toString());
    expect(columns[5].getText()).toBe(validComment.body);
  });
});
