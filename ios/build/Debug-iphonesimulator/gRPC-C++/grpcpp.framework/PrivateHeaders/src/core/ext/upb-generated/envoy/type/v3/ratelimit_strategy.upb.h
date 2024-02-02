/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/type/v3/ratelimit_strategy.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#ifndef ENVOY_TYPE_V3_RATELIMIT_STRATEGY_PROTO_UPB_H_
#define ENVOY_TYPE_V3_RATELIMIT_STRATEGY_PROTO_UPB_H_

#include "upb/msg_internal.h"
#include "upb/decode.h"
#include "upb/decode_fast.h"
#include "upb/encode.h"

#include "upb/port_def.inc"

#ifdef __cplusplus
extern "C" {
#endif

struct envoy_type_v3_RateLimitStrategy;
struct envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit;
typedef struct envoy_type_v3_RateLimitStrategy envoy_type_v3_RateLimitStrategy;
typedef struct envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit;
extern const upb_MiniTable envoy_type_v3_RateLimitStrategy_msginit;
extern const upb_MiniTable envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit;
struct envoy_type_v3_TokenBucket;
extern const upb_MiniTable envoy_type_v3_TokenBucket_msginit;

typedef enum {
  envoy_type_v3_RateLimitStrategy_ALLOW_ALL = 0,
  envoy_type_v3_RateLimitStrategy_DENY_ALL = 1
} envoy_type_v3_RateLimitStrategy_BlanketRule;



/* envoy.type.v3.RateLimitStrategy */

UPB_INLINE envoy_type_v3_RateLimitStrategy* envoy_type_v3_RateLimitStrategy_new(upb_Arena* arena) {
  return (envoy_type_v3_RateLimitStrategy*)_upb_Message_New(&envoy_type_v3_RateLimitStrategy_msginit, arena);
}
UPB_INLINE envoy_type_v3_RateLimitStrategy* envoy_type_v3_RateLimitStrategy_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_type_v3_RateLimitStrategy* ret = envoy_type_v3_RateLimitStrategy_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_type_v3_RateLimitStrategy_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_type_v3_RateLimitStrategy* envoy_type_v3_RateLimitStrategy_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_type_v3_RateLimitStrategy* ret = envoy_type_v3_RateLimitStrategy_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_type_v3_RateLimitStrategy_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_type_v3_RateLimitStrategy_serialize(const envoy_type_v3_RateLimitStrategy* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_type_v3_RateLimitStrategy_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_type_v3_RateLimitStrategy_serialize_ex(const envoy_type_v3_RateLimitStrategy* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_type_v3_RateLimitStrategy_msginit, options, arena, &ptr, len);
  return ptr;
}
typedef enum {
  envoy_type_v3_RateLimitStrategy_strategy_blanket_rule = 1,
  envoy_type_v3_RateLimitStrategy_strategy_requests_per_time_unit = 2,
  envoy_type_v3_RateLimitStrategy_strategy_token_bucket = 3,
  envoy_type_v3_RateLimitStrategy_strategy_NOT_SET = 0
} envoy_type_v3_RateLimitStrategy_strategy_oneofcases;
UPB_INLINE envoy_type_v3_RateLimitStrategy_strategy_oneofcases envoy_type_v3_RateLimitStrategy_strategy_case(const envoy_type_v3_RateLimitStrategy* msg) {
  return (envoy_type_v3_RateLimitStrategy_strategy_oneofcases)*UPB_PTR_AT(msg, UPB_SIZE(0, 0), int32_t);
}
UPB_INLINE bool envoy_type_v3_RateLimitStrategy_has_blanket_rule(const envoy_type_v3_RateLimitStrategy* msg) {
  return _upb_getoneofcase(msg, UPB_SIZE(0, 0)) == 1;
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_clear_blanket_rule(const envoy_type_v3_RateLimitStrategy* msg) {
  UPB_WRITE_ONEOF(msg, int32_t, UPB_SIZE(4, 8), 0, UPB_SIZE(0, 0), envoy_type_v3_RateLimitStrategy_strategy_NOT_SET);
}
UPB_INLINE int32_t envoy_type_v3_RateLimitStrategy_blanket_rule(const envoy_type_v3_RateLimitStrategy* msg) {
  return UPB_READ_ONEOF(msg, int32_t, UPB_SIZE(4, 8), UPB_SIZE(0, 0), 1, 0);
}
UPB_INLINE bool envoy_type_v3_RateLimitStrategy_has_requests_per_time_unit(const envoy_type_v3_RateLimitStrategy* msg) {
  return _upb_getoneofcase(msg, UPB_SIZE(0, 0)) == 2;
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_clear_requests_per_time_unit(const envoy_type_v3_RateLimitStrategy* msg) {
  UPB_WRITE_ONEOF(msg, envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit*, UPB_SIZE(4, 8), 0, UPB_SIZE(0, 0), envoy_type_v3_RateLimitStrategy_strategy_NOT_SET);
}
UPB_INLINE const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* envoy_type_v3_RateLimitStrategy_requests_per_time_unit(const envoy_type_v3_RateLimitStrategy* msg) {
  return UPB_READ_ONEOF(msg, const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit*, UPB_SIZE(4, 8), UPB_SIZE(0, 0), 2, NULL);
}
UPB_INLINE bool envoy_type_v3_RateLimitStrategy_has_token_bucket(const envoy_type_v3_RateLimitStrategy* msg) {
  return _upb_getoneofcase(msg, UPB_SIZE(0, 0)) == 3;
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_clear_token_bucket(const envoy_type_v3_RateLimitStrategy* msg) {
  UPB_WRITE_ONEOF(msg, struct envoy_type_v3_TokenBucket*, UPB_SIZE(4, 8), 0, UPB_SIZE(0, 0), envoy_type_v3_RateLimitStrategy_strategy_NOT_SET);
}
UPB_INLINE const struct envoy_type_v3_TokenBucket* envoy_type_v3_RateLimitStrategy_token_bucket(const envoy_type_v3_RateLimitStrategy* msg) {
  return UPB_READ_ONEOF(msg, const struct envoy_type_v3_TokenBucket*, UPB_SIZE(4, 8), UPB_SIZE(0, 0), 3, NULL);
}

UPB_INLINE void envoy_type_v3_RateLimitStrategy_set_blanket_rule(envoy_type_v3_RateLimitStrategy *msg, int32_t value) {
  UPB_WRITE_ONEOF(msg, int32_t, UPB_SIZE(4, 8), value, UPB_SIZE(0, 0), 1);
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_set_requests_per_time_unit(envoy_type_v3_RateLimitStrategy *msg, envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* value) {
  UPB_WRITE_ONEOF(msg, envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit*, UPB_SIZE(4, 8), value, UPB_SIZE(0, 0), 2);
}
UPB_INLINE struct envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* envoy_type_v3_RateLimitStrategy_mutable_requests_per_time_unit(envoy_type_v3_RateLimitStrategy* msg, upb_Arena* arena) {
  struct envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* sub = (struct envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit*)envoy_type_v3_RateLimitStrategy_requests_per_time_unit(msg);
  if (sub == NULL) {
    sub = (struct envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit*)_upb_Message_New(&envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit, arena);
    if (!sub) return NULL;
    envoy_type_v3_RateLimitStrategy_set_requests_per_time_unit(msg, sub);
  }
  return sub;
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_set_token_bucket(envoy_type_v3_RateLimitStrategy *msg, struct envoy_type_v3_TokenBucket* value) {
  UPB_WRITE_ONEOF(msg, struct envoy_type_v3_TokenBucket*, UPB_SIZE(4, 8), value, UPB_SIZE(0, 0), 3);
}
UPB_INLINE struct envoy_type_v3_TokenBucket* envoy_type_v3_RateLimitStrategy_mutable_token_bucket(envoy_type_v3_RateLimitStrategy* msg, upb_Arena* arena) {
  struct envoy_type_v3_TokenBucket* sub = (struct envoy_type_v3_TokenBucket*)envoy_type_v3_RateLimitStrategy_token_bucket(msg);
  if (sub == NULL) {
    sub = (struct envoy_type_v3_TokenBucket*)_upb_Message_New(&envoy_type_v3_TokenBucket_msginit, arena);
    if (!sub) return NULL;
    envoy_type_v3_RateLimitStrategy_set_token_bucket(msg, sub);
  }
  return sub;
}

/* envoy.type.v3.RateLimitStrategy.RequestsPerTimeUnit */

UPB_INLINE envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_new(upb_Arena* arena) {
  return (envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit*)_upb_Message_New(&envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit, arena);
}
UPB_INLINE envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_parse(const char* buf, size_t size, upb_Arena* arena) {
  envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* ret = envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit, NULL, 0, arena) != kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_parse_ex(const char* buf, size_t size,
                           const upb_ExtensionRegistry* extreg,
                           int options, upb_Arena* arena) {
  envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* ret = envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_new(arena);
  if (!ret) return NULL;
  if (upb_Decode(buf, size, ret, &envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit, extreg, options, arena) !=
      kUpb_DecodeStatus_Ok) {
    return NULL;
  }
  return ret;
}
UPB_INLINE char* envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_serialize(const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* msg, upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit, 0, arena, &ptr, len);
  return ptr;
}
UPB_INLINE char* envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_serialize_ex(const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* msg, int options,
                                 upb_Arena* arena, size_t* len) {
  char* ptr;
  (void)upb_Encode(msg, &envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_msginit, options, arena, &ptr, len);
  return ptr;
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_clear_requests_per_time_unit(const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 8), uint64_t) = 0;
}
UPB_INLINE uint64_t envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_requests_per_time_unit(const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(8, 8), uint64_t);
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_clear_time_unit(const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* msg) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), int32_t) = 0;
}
UPB_INLINE int32_t envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_time_unit(const envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit* msg) {
  return *UPB_PTR_AT(msg, UPB_SIZE(0, 0), int32_t);
}

UPB_INLINE void envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_set_requests_per_time_unit(envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit *msg, uint64_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(8, 8), uint64_t) = value;
}
UPB_INLINE void envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit_set_time_unit(envoy_type_v3_RateLimitStrategy_RequestsPerTimeUnit *msg, int32_t value) {
  *UPB_PTR_AT(msg, UPB_SIZE(0, 0), int32_t) = value;
}

extern const upb_MiniTable_File envoy_type_v3_ratelimit_strategy_proto_upb_file_layout;

#ifdef __cplusplus
}  /* extern "C" */
#endif

#include "upb/port_undef.inc"

#endif  /* ENVOY_TYPE_V3_RATELIMIT_STRATEGY_PROTO_UPB_H_ */