import torch

def predict(data):
    # Example or inference. This model returns a 1-dim tensor multiplied by 2
    ts = torch.jit.load('./doubleit_model.pt')
    sample_tensor = torch.tensor(data)
    result = ts(sample_tensor)
    # print(result)  # <- tensor([2, 4, 6, 8]) 
    return result