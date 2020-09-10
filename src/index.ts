import isEqual from 'lodash.isequal';
import db1 from '../db/cma-artworks.json';
import db2 from '../db/cma-artworks-basic.json';

const simpleCompare = (_a: any, _b: any) => {
  for (let i = 0; i < _a.length; i++) {
    const a = _a[i];
    const b = _b[i];
    if (a.id != b.id) {
      console.log([a, b]);
      throw Error(`Error at ${i}: Non matching IDs`);
    }
  }

  return true;
};

export const testDatabaseEquality = () => simpleCompare(db1, db2);

// export const testDatabaseEquality = () => {
//   var delta = jsondiffpatch.diff(db1, db2);
//   console.log(delta);
//   return true;
// };
