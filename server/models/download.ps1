$models = @(
    "nlpconnect/vit-gpt2-image-captioning",
    "lllyasviel/ControlNet",
    "lllyasviel/sd-controlnet-canny",
    "lllyasviel/sd-controlnet-depth",
    "lllyasviel/sd-controlnet-hed",
    "lllyasviel/sd-controlnet-mlsd",
    "lllyasviel/sd-controlnet-openpose",
    "lllyasviel/sd-controlnet-scribble",
    "lllyasviel/sd-controlnet-seg",
    "runwayml/stable-diffusion-v1-5",
    "Salesforce/blip-image-captioning-large",
    "damo-vilab/text-to-video-ms-1.7b",
    "microsoft/speecht5_asr",
    "facebook/maskformer-swin-large-ade",
    "microsoft/biogpt",
    "facebook/esm2_t12_35M_UR50D",
    "JorisCos/DCCRNet_Libri1Mix_enhsingle_16k",
    "espnet/kan-bayashi_ljspeech_vits",
    "facebook/detr-resnet-101",
    "microsoft/speecht5_tts",
    "microsoft/speecht5_hifigan",
    "microsoft/speecht5_vc",
    "openai/whisper-base",
    "Intel/dpt-large",
    "facebook/detr-resnet-50-panoptic",
    "facebook/detr-resnet-50",
    "google/owlvit-base-patch32",
    "impira/layoutlm-document-qa",
    "ydshieh/vit-gpt2-coco-en",
    "dandelin/vilt-b32-finetuned-vqa",
    "lambdalabs/sd-image-variations-diffusers",
    "facebook/maskformer-swin-base-coco",
    "Intel/dpt-hybrid-midas"
)

$CURRENT_DIR = Get-Location

foreach ($model in $models) {
    Write-Host "----- Downloading from https://huggingface.co/$model -----"
    if (Test-Path $model) {
        Set-Location $model
        git pull
        git lfs pull
        Set-Location $CURRENT_DIR
    } else {
        git clone "https://huggingface.co/$model" $model
    }
}

$datasets = @(
    "Matthijs/cmu-arctic-xvectors"
)

foreach ($dataset in $datasets) {
    Write-Host "----- Downloading from https://huggingface.co/datasets/$dataset -----"
    if (Test-Path $dataset) {
        Set-Location $dataset
        git pull
        git lfs pull
        Set-Location $CURRENT_DIR
    } else {
        git clone "https://huggingface.co/datasets/$dataset" $dataset
    }
}