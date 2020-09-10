import { testDatabaseEquality } from '..';

test('all exported databases are equal', () => {
  expect(testDatabaseEquality()).toBe(true);
});
