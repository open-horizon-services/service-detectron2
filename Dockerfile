FROM ubuntu:latest
RUN apt update && apt install -y python3 python3-pip git ffmpeg libsm6 libxext6 
RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu
RUN pip3 install opencv-python
RUN git clone https://github.com/facebookresearch/detectron2.git
RUN python3 -m pip install -e detectron2
COPY input.jpg /output.jpg
CMD cd detectron2/demo; python3 demo.py --config-file ../configs/COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml --input /output.jpg --output /outputs --opts MODEL.DEVICE cpu MODEL.WEIGHTS 'detectron2://COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x/137849600/model_final_f10217.pkl'

