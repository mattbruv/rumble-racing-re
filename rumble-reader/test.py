
import struct
import numpy as np
import matplotlib.pyplot as plt

# Read file
with open("elda.bin", "rb") as f:
    data = f.read()

# Interpret as little-endian float32
floats = np.frombuffer(data, dtype="<f4")

# Find plausible float triplets (-10 to +10 range)
groups = []
for i in range(0, len(floats) - 3, 3):
    v = floats[i:i+3]
    if np.all(np.isfinite(v)) and np.any(v != 0) and np.all(np.abs(v) < 10):
        groups.append(v)
groups = np.array(groups)

# Show first few groups
print(groups[:10])

# Plot 3D scatter
fig = plt.figure(figsize=(6, 6))
ax = fig.add_subplot(111, projection="3d")
ax.scatter(groups[:,0], groups[:,1], groups[:,2], s=8)
ax.set_title("3D Distribution of Float Triplets")
ax.set_xlabel("X")
ax.set_ylabel("Y")
ax.set_zlabel("Z")
plt.show()
