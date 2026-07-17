#python tools/get_sbert_embedding.py --sbert_model "PartAI/Tooka-SBERT-V2-Large" --task farexstance
python tools/get_sbert_embedding.py --sbert_model "PartAI/Tooka-SBERT-V2-Large" --task farexstance --do_test --seed 42
for seed in 13 21 87 100
do
    for task in farexstance
    do
        cp data/k-shot/$task/16-42/test.npy  data/k-shot/$task/16-$seed/
    done
done
counter=0
for task in farexstance
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
              bash run_experiment_train_demo-filter.sh "--mapping_path final_label_mapping/farexstance/16-$seed.sort.txt --mapping_id 0"
          done
      done
  done
done
