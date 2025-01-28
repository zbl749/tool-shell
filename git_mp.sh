#!/bin/bash

# 检查是否传入了目标分支和要合并的分支
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <target-branch> <source-branch>"
    exit 1
fi

# 获取传入的目标分支和源分支
TARGET_BRANCH=$1
SOURCE_BRANCH=$2

# 获取当前分支
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 切换到目标分支
echo "Switching to target branch: $TARGET_BRANCH"
git checkout "$TARGET_BRANCH"
if [ $? -ne 0 ]; then
    echo "Error: Failed to checkout to $TARGET_BRANCH"
    exit 1
fi

# 更新目标分支代码
git pull

# 合并源分支到目标分支
echo "Merging $SOURCE_BRANCH into $TARGET_BRANCH"
git merge "$SOURCE_BRANCH"
if [ $? -ne 0 ]; then
    echo "Error: Merge failed!"
    exit 1
fi

# 切换回原始分支
echo "Switching back to original branch: $CURRENT_BRANCH"
git checkout "$CURRENT_BRANCH"
if [ $? -ne 0 ]; then
    echo "Error: Failed to checkout back to $CURRENT_BRANCH"
    exit 1
fi

echo "Merge completed successfully!"
