#
# Copyright (C) 2014  Mozilla Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

nfcemu_SRC_FILES := base64.c\
                    cb.c \
                    cmdline.c \
                    llcp.c \
                    llcp-snep.c \
                    ndef.c \
                    nfc.c \
                    nfc-hci.c \
                    nfc-nci.c \
                    nfc-re.c \
                    nfc-rf.c \
                    nfc-tag.c \
                    nfcemu.c \
                    snep.c

#
# 32-bit library
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(nfcemu_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libnfcemu
include $(BUILD_HOST_SHARED_LIBRARY)

#
# 64-bit library
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(nfcemu_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include
LOCAL_CFLAGS := -m64
LOCAL_LDFLAGS := -m64
LOCAL_LDLIBS := -m64
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := lib64nfcemu
include $(BUILD_HOST_SHARED_LIBRARY)
