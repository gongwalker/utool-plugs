# utool timestampe plug
# @Author: gongwen
# @Date:   2022-06-25 20:12:03

input='{{subinput:请输入 date or timestamp}}'
time_pattern="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}$"
date_pattern="^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$"
timestamp_pattern="^((0)|([1-9][0-9]*))$"

# trim前后空格
input=`echo "${input}" | grep -o "[^ ]\+\( \+[^ ]\+\)*"`

case $input in
  now | "")
    echo "当前时间"
    current_timestamp=`date +%s`
    echo ${current_timestamp}
    echo `dateStr= date -r${current_timestamp} +"%Y-%m-%d %H:%M:%S"`
    ;;
  *)
    if [[ "${input}" =~ ${time_pattern} ]];then
      echo "年-月-日 时:分:秒 => 时间戳"
      echo `date -j -f "%Y-%m-%d %H:%M:%S" "${input}" +%s`
      echo ${input}
    elif [[ "${input}" =~ ${date_pattern} ]];then
      echo "年-月-日 => 时间戳"
      echo `date -j -f "%Y-%m-%d" "${input}" +%s`
      echo ${input}
    elif [[ "${input}" =~ ${timestamp_pattern} ]];then
      echo "时间戳 => 年-月-日 时:分:秒"
      echo ${input}
      echo `dateStr= date -r${input} +"%Y-%m-%d %H:%M:%S"`
    else
      echo "请输入 日期格式(e.g. 2006-01-02 15:04:05) 或 时间戳(e.g. 1602482956)"  
    fi
esac
echo "========================================================================"
echo ""
