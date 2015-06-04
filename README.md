# islam_victoria
The codes of the paper Research of Localization with Laser Scan and Iterative Bayesian Strategy

**The bibtex of this paper is :**</br>
@article{���Ƿ�2015���ڼ���ɨ��͵�����Ҷ˹���ԵĶ�λ�о�,</br>
  title={���ڼ���ɨ��͵�����Ҷ˹���ԵĶ�λ�о�},</br>
  author={���Ƿ� and ������ and ����ݥ and �Ų�},</br>
  journal={��������������},</br>
  year={2015}</br>
}

# About the project
```
Run the script "run.m", and you can see the demo of EKF-SLAM or IEKF-SLAM on the Victoria Park data set by setting the switches. Also, you can change the configurations and other switches in "run.m" to get different results. 
```
**Note:**

Before run the script "run.m", you should set the path by hand. In the Matlab menu, just click Home->Set path->Add folder, and select the path of the file "IEKF and EKF SLAM on VictoriaPark data".

**The following files mean :**
## Data
Victoria Park data set and the satellite map. 
* **gps.mat :** ground truth.
* **victoriaPark.txt :** odometry and observations in Victoria Park data set.

## Filter
It contains the filter codes for SLAM execution.
* **predictEKF.m :** predict step of EKF and IEKF SLAM. 
* **updateEKF.m :** update step of EKF-SLAM.
* **updateIEKF.m** and **iterate.m :** update step of IEKF-SLAM.
* **augmentState.m :** augment step, that is add new features to the map.
## Utilities
Models and tools for SLAM demo. 
* **compound.m :** complete the estimating uncertain spatial relationships in robotics.
* **corresponding.m :** classify features with known corresponding.
* **piTopi.m :** make sure the angle is in [-pi, pi].
* **obsModel.m :** observation model.

**The demo shows on [youku](http://www.dwz.cn/iekfonVictoriaPark)**