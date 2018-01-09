import axios from 'axios';

const instance = axios.create();

function createAPI(baseURL) {
  return function (conf) {
    conf = conf || {};
    return instance(Object.assign({}, {
      url: conf.url,
      baseURL: baseURL,
      method: conf.method
    }, conf.opts));
  };
}

/* Array 对象 */
//let arr = ["a", "b", "c"];
//console.log(Object.keys(arr)); 
// ['0', '1', '2']

/* 类数组 对象 */
// let obj = { 0 : "a", 1 : "b", 2 : "c"};
// console.log(Object.keys(obj)); 
// ['0', '1', '2']
function convertRESTAPI(url, opts) {
  console.log(url)
  if (!opts || !opts.path) return url;

  const pathKeys = Object.keys(opts.path);

  pathKeys.forEach((key) => {
    console.log('(:' + key + '|{' + key + '})' + opts.path[key])
    const r = new RegExp('(:' + key + '|{' + key + '})', 'g');
    url = url.replace(r, opts.path[key]);
  });
  console.log(url)
  return url;
}

export {
  createAPI,
  convertRESTAPI
};
