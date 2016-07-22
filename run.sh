# 若需要自动化构建，请直接调用此脚本。
# 注意： 务必正确配置config.yaml中的 project_file_path 和 targetName,
#       否则，脚本无法正确执行!!!
#!/bin/bash
SCRIPT_PATH=$(cd `dirname $0`; pwd)
cd $SCRIPT_PATH

echo "working dir: $SCRIPT_PATH"
echo 'pkg begin...'
export LANG="zh_CN.UTF-8"

if -n $1
ruby ./run.rb $1
then
ruby ./run.rb
fi
echo 'pkg end...'
