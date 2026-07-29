#
sleep 15h
python tools/sort_mapping.py --condition "{'tag': 'exp-mapping-sentipers_multiclass', 'task_name': 'sentipers_multiclass'}" --mapping_dir my_auto_label_mapping/manual_template
counter=0
for task in sentipers_multiclass
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 4e-5
          do
              TAG="${task}_train_no-demo" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh "--mapping_path my_auto_label_mapping/manual_template/sentipers_multiclass/16-$seed.sort.txt --mapping_id 0"
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 900
              fi
          done
      done
  done
done
counter=0
sleep 7200s
for task in sentipers_multiclass
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 5e-5
          do
              TAG="${task}_train_demo" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train.sh "--mapping_path my_auto_label_mapping/manual_template/sentipers_multiclass/16-$seed.sort.txt --mapping_id 0"
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 900
              fi
          done
      done
  done
done
