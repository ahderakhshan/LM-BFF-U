
for task in miras-sparrow
do
  for seed in 13
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_no-train_no-demo_autolabel" \
              TYPE=prompt \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_no_train.sh "--mapping_path final_label_mapping/miras-sparrow/16-$seed.txt --mapping_id 0"
          done
      done
  done
done


for task in miras-sparrow farstail farexstance
do
  for seed in 13
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_no-train_demo" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_no_train.sh
          done
      done
  done
done