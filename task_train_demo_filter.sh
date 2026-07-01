python tools/get_sbert_embedding.py --sbert_model "PartAI/Tooka-SBERT-V2-Large" --task miras-sparrow
python tools/get_sbert_embedding.py --sbert_model "PartAI/Tooka-SBERT-V2-Large" --task miras-sparrow --do_test --seed 42
for seed in 13 21 87 100
do
    for task in miras-sparrow
    do
        cp data/k-shot/$task/16-42/test.npy  data/k-shot/$task/16-$seed/
    done
done
counter=0
for task in miras-sparrow
do
  for seed in 13 21 42 87 100
  do
      for bs in 2 4 8
      do
          for lr in 1e-5 2e-5 5e-5
          do
              TAG="${task}_train_demo-filter" \
              TYPE=prompt-demo \
              TASK="${task}" \
              BS=$bs \
              LR=$lr \
              SEED=$seed \
              MODEL=FacebookAI/xlm-roberta-large \
              bash run_experiment_train_demo-filter.sh
              sleep 120s
              ((counter++))
              if (( counter % 10 == 0 )); then
                sleep 900s
              fi
          done
      done
  done
done