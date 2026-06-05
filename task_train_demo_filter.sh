for task in miras-sparrow farstail farexstance
do
  for seed in 13 21 42 87 100
  do
      for bs in 8
      do
          for lr in 5e-5
          do
              TAG="${task}_train_demo-filter" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train_demo-filter.sh
          done
      done
  done
done