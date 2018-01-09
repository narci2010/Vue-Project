import instance from './instance';
import { convertRESTAPI } from '../util';

/** Logs user into the system */
function v2_user_login_get(opts) {
  return instance({
    method: 'get',
    url: '/v2/user/login',
    opts: opts
  });
}

/** Logs out current logged in user session */
function v2_user_logout_get(opts) {
  return instance({
    method: 'get',
    url: '/v2/user/logout',
    opts: opts
  });
}

/** Get user by user name */
function v2_user_username_get(opts) {
  return instance({
    method: 'get',
    url: convertRESTAPI('/v2/user/{username}', opts),
    opts: opts
  });
}

/** Updated user */
function v2_user_username_put(opts) {
  return instance({
    method: 'put',
    url: convertRESTAPI('/v2/user/{username}', opts),
    opts: opts
  });
}

/** Delete user */
function v2_user_username_delete(opts) {
  return instance({
    method: 'delete',
    url: convertRESTAPI('/v2/user/{username}', opts),
    opts: opts
  });
}

/** Returns pet inventories by status */
function v2_store_inventory_get(opts) {
  return instance({
    method: 'get',
    url: '/v2/store/inventory',
    opts: opts
  });
}

/** Place an order for a pet */
function v2_store_order_post(opts) {
  return instance({
    method: 'post',
    url: '/v2/store/order',
    opts: opts
  });
}

/** Find purchase order by ID */
function v2_store_order_orderId_get(opts) {
  return instance({
    method: 'get',
    url: convertRESTAPI('/v2/store/order/{orderId}', opts),
    opts: opts
  });
}

/** Delete purchase order by ID */
function v2_store_order_orderId_delete(opts) {
  return instance({
    method: 'delete',
    url: convertRESTAPI('/v2/store/order/{orderId}', opts),
    opts: opts
  });
}

/** Create user */
function v2_user_post(opts) {
  return instance({
    method: 'post',
    url: '/v2/user',
    opts: opts
  });
}

/** Creates list of users with given input array */
function v2_user_createWithArray_post(opts) {
  return instance({
    method: 'post',
    url: '/v2/user/createWithArray',
    opts: opts
  });
}

/** Creates list of users with given input array */
function v2_user_createWithList_post(opts) {
  return instance({
    method: 'post',
    url: '/v2/user/createWithList',
    opts: opts
  });
}

/** Finds Pets by status */
function v2_pet_findByStatus_get(opts) {
  return instance({
    method: 'get',
    url: '/v2/pet/findByStatus',
    opts: opts
  });
}

/** Finds Pets by tags */
function v2_pet_findByTags_get(opts) {
  return instance({
    method: 'get',
    url: '/v2/pet/findByTags',
    opts: opts
  });
}

/** Find pet by ID */
function v2_pet_petId_get(opts) {
  console.log('petid')
  return instance({
    method: 'get',
    url: convertRESTAPI('/v2/pet/{petId}', opts),
    opts: opts
  });
}

/** Updates a pet in the store with form data */
function v2_pet_petId_post(opts) {
  return instance({
    method: 'post',
    url: convertRESTAPI('/v2/pet/{petId}', opts),
    opts: opts
  });
}

/** Deletes a pet */
function v2_pet_petId_delete(opts) {
  return instance({
    method: 'delete',
    url: convertRESTAPI('/v2/pet/{petId}', opts),
    opts: opts
  });
}

/** uploads an image */
function v2_pet_petId_uploadImage_post(opts) {
  return instance({
    method: 'post',
    url: convertRESTAPI('/v2/pet/{petId}/uploadImage', opts),
    opts: opts
  });
}

/** Add a new pet to the store */
function v2_pet_post(opts) {
  return instance({
    method: 'post',
    url: '/v2/pet',
    opts: opts
  });
}

/** Update an existing pet */
function v2_pet_put(opts) {
  return instance({
    method: 'put',
    url: '/v2/pet',
    opts: opts
  });
}

export {
  v2_user_login_get,
  v2_user_logout_get,
  v2_user_username_get,
  v2_user_username_put,
  v2_user_username_delete,
  v2_store_inventory_get,
  v2_store_order_post,
  v2_store_order_orderId_get,
  v2_store_order_orderId_delete,
  v2_user_post,
  v2_user_createWithArray_post,
  v2_user_createWithList_post,
  v2_pet_findByStatus_get,
  v2_pet_findByTags_get,
  v2_pet_petId_get,
  v2_pet_petId_post,
  v2_pet_petId_delete,
  v2_pet_petId_uploadImage_post,
  v2_pet_post,
  v2_pet_put
};
