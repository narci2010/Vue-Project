import { createAPI } from '../util';
import config from '../config';

const baseUrl = {
  mock: 'https://www.easy-mock.com/mock/5a50d59caaeb8a0aa380bc36/test',
  dev: '',
  pre: '',
  prod: ''
}[config.env || 'mock'];

export default createAPI(baseUrl);
