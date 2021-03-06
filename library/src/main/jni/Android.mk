LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := cpucheck
LOCAL_SRC_FILES := \
	cpu_check.c

LOCAL_STATIC_LIBRARIES := cpufeatures
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := ffts
LOCAL_C_INCLUDES := jni/include jni/src
LOCAL_CFLAGS := -DHAVE_DECL_MEMALIGN -DHAVE_STDLIB_H -std=c99 \
	-Wno-pointer-to-int-cast -Wno-int-to-pointer-cast
LOCAL_SRC_FILES := \
	ffts_jni.c \
	src/ffts.c \
	src/ffts_chirp_z.c \
	src/ffts_nd.c \
	src/ffts_real.c \
	src/ffts_real_nd.c \
	src/ffts_static.c \
	src/ffts_transpose.c \
	src/ffts_trig.c
LOCAL_LDLIBS := -llog 

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_MODULE := ffts-vfp
LOCAL_CFLAGS += -DHAVE_VFP
LOCAL_SRC_FILES += \
	src/codegen.c \
	src/vfp.s

include $(BUILD_SHARED_LIBRARY)
endif

include $(CLEAR_VARS)

LOCAL_MODULE := ffts
LOCAL_C_INCLUDES := jni/include jni/src
LOCAL_CFLAGS := -DHAVE_DECL_MEMALIGN -DHAVE_STDLIB_H -std=c99 \
	-Wno-pointer-to-int-cast -Wno-int-to-pointer-cast
LOCAL_SRC_FILES := \
	ffts_jni.c \
	src/ffts.c \
	src/ffts_chirp_z.c \
	src/ffts_nd.c \
	src/ffts_real.c \
	src/ffts_real_nd.c \
	src/ffts_static.c \
	src/ffts_transpose.c \
	src/ffts_trig.c
LOCAL_LDLIBS := -llog 

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_MODULE := ffts-neon
LOCAL_CFLAGS += -DHAVE_NEON
LOCAL_ARM_NEON := true
LOCAL_SRC_FILES += \
	src/codegen.c \
	src/neon.s

include $(BUILD_SHARED_LIBRARY)
endif

include $(CLEAR_VARS)

LOCAL_MODULE := ffts
LOCAL_C_INCLUDES := jni/include jni/src
LOCAL_CFLAGS := -DHAVE_DECL_MEMALIGN -DHAVE_STDLIB_H -std=c99 \
	-Wno-pointer-to-int-cast -Wno-int-to-pointer-cast
LOCAL_SRC_FILES := \
	ffts_jni.c \
	src/ffts.c \
	src/ffts_chirp_z.c \
	src/ffts_nd.c \
	src/ffts_real.c \
	src/ffts_real_nd.c \
	src/ffts_static.c \
	src/ffts_transpose.c \
	src/ffts_trig.c
LOCAL_LDLIBS := -llog 

ifeq ($(TARGET_ARCH_ABI),x86_64)
LOCAL_MODULE := ffts-sse
LOCAL_CFLAGS += -DHAVE_SSE
LOCAL_SRC_FILES += \
	src/codegen.c \
	src/sse.s

include $(BUILD_SHARED_LIBRARY)
endif

$(call import-module,android/cpufeatures)
