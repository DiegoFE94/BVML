
<!-- README.md is generated from README.Rmd. Please edit that file -->

# BVML

<!-- badges: start -->

<!-- badges: end -->

BVML is a patient stratification package for Bacteral Vaginosis disease.
This package through a pre-trained Random Forest model and metagenomic
profile of 8 bacterial species is able to classify patients into three
classes:

  - Class C1: patients with incipient dysbiosis.
  - Class C2: patients with a BV+ profile.
  - Class C3: patients with a BV- profile.

## Installation

To install the BVML, install from github using devtools:

``` r
install.packages("devtools")
library(devtools)
devtools::install_github("DiegoFE94/BVML")
```

## Main fuction

  - BVClassify: This function has as input a dataframe whose columns
    correspond to the selected species (in the correct format) and rows
    correspond to the samples. You can choose the type of input format
    of the species you are using by using the type (character string)
    parameter. If you are using species names you should specify
    “species”, however if you are using NCBI IDs you should specify
    “NCBI”. It also has another parameter named plot\_HM that have
    logical value TRUE/FALSE. This function performs the classification
    of the samples into the three corresponding classes of the
    algorithm. The output is a dataframe where the columns correspond to
    the samples, the columns correspond to the probability of belonging
    to each class and to which class it corresponds according to the
    algorithm. In addition if TRUE is selected in the plot\_HM variable,
    the function returns a Heatmap with the metagenomic profile in
    addition to the dataframe.

## Internal Functionalities

This section explains the different functionalities that constitute the
main fuction.

  - convert\_ncbi\_ID: This function has as input a dataframe in which
    the columns correspond to the NCBI IDs of the 8 species and the rows
    to the samples. The function converts the NCBI IDs to the species
    names in the correct format for prediction.

  - check\_sps: This function has as input a dataframe whose columns
    correspond to the selected species and rows correspond to the
    samples. This function checks that all the required species are
    present in the dataframe and that they are in the correct format.
    Also try to put the species names in the required format.

  - normdataset: This function has as input a dataframe whose columns
    correspond to the selected species and rows correspond to the
    samples. This function performs the log2 normalization of the
    species, a preprocessing necessary to perform the prediction.

## Example

This is a basic example which shows you how to use the package:

``` r
library(BVML)
# First charge a demo dataset
data(sample_data)
# Final step: make class prediction using species names and plotting the Heatmap
results <- BVClassify(sample_data, type = "species", plot_HM = TRUE)
print(results)
```

<img src="man/figures/README-example-1.png" width="100%" />

    #> $results
    #>       prob.C1 prob.C2 prob.C3 response
    #> X1130   0.964   0.027   0.009       C1
    #> X1239   0.000   0.000   1.000       C3
    #> X1126   0.270   0.707   0.023       C2
    #> X1137   0.992   0.000   0.008       C1
    #> X1128   0.012   0.001   0.987       C3
    #> X1211   0.086   0.001   0.913       C3
    #> X1326   0.999   0.000   0.001       C1
    #> X1284   0.999   0.000   0.001       C1
    #> X1290   0.000   0.000   1.000       C3
    #> X1216   0.001   0.000   0.999       C3
    #> X1236   0.000   0.000   1.000       C3
    #> X1206   0.000   0.000   1.000       C3
    #> X1253   0.053   0.052   0.895       C3
    #> X1316   0.997   0.000   0.003       C1
    #> X1298   0.000   0.000   1.000       C3
    #> X1300   0.000   0.000   1.000       C3
    #> X1146   0.000   0.000   1.000       C3
    #> X1241   0.000   0.000   1.000       C3
    #> X1240   0.000   0.000   1.000       C3
    #> X1261   0.879   0.092   0.029       C1
    #> X1223   0.004   0.000   0.996       C3
    #> X1262   0.000   0.000   1.000       C3
    #> X1265   0.000   0.000   1.000       C3
    #> X1186   0.999   0.000   0.001       C1
    #> X1121   0.000   0.000   1.000       C3
    #> X1258   0.994   0.000   0.006       C1
    #> X1176   0.999   0.000   0.001       C1
    #> X1263   0.036   0.004   0.960       C3
    #> X1117   0.026   0.000   0.974       C3
    #> X1234   0.946   0.027   0.027       C1
    #> X1177   0.454   0.000   0.546       C3
    #> X1149   0.000   0.000   1.000       C3
    #> X1237   0.012   0.001   0.987       C3
    #> X1193   0.001   0.000   0.999       C3
    #> X1103   0.999   0.000   0.001       C1
    #> X1165   0.000   0.000   1.000       C3
    #> X1185   0.000   0.000   1.000       C3
    #> X1096   0.999   0.000   0.001       C1
    #> X1201   0.000   0.000   1.000       C3
    #> X1119   0.999   0.000   0.001       C1
    #> X1136   0.812   0.156   0.032       C1
    #> X1210   0.000   0.000   1.000       C3
    #> X1200   0.119   0.100   0.781       C3
    #> X1264   0.989   0.001   0.010       C1
    #> X1199   0.999   0.000   0.001       C1
    #> X1142   0.000   0.000   1.000       C3
    #> X1181   0.026   0.000   0.974       C3
    #> X1110   0.953   0.020   0.027       C1
    #> X1191   0.022   0.000   0.978       C3
    #> X1131   0.987   0.000   0.013       C1
    #> X1111   0.999   0.000   0.001       C1
    #> X1289   0.000   0.000   1.000       C3
    #> X1093   0.000   0.000   1.000       C3
    #> X1099   0.000   0.000   1.000       C3
    #> X1175   0.991   0.000   0.009       C1
    #> X1254   0.098   0.002   0.900       C3
    #> X1159   0.000   0.000   1.000       C3
    #> X1269   0.999   0.000   0.001       C1
    #> X1271   0.067   0.000   0.933       C3
    #> X1094   0.022   0.000   0.978       C3
    #> X1283   0.000   0.000   1.000       C3
    #> X1106   0.999   0.000   0.001       C1
    #> X1293   0.999   0.000   0.001       C1
    #> X1107   0.999   0.000   0.001       C1
    #> X1140   0.972   0.020   0.008       C1
    #> X1295   0.022   0.000   0.978       C3
    #> X1297   0.000   0.000   1.000       C3
    #> X1302   0.166   0.059   0.775       C3
    #> X1255   0.000   0.000   1.000       C3
    #> X1116   0.000   0.000   1.000       C3
    #> X1305   0.996   0.000   0.004       C1
    #> X1227   0.000   0.000   1.000       C3
    #> X1224   0.999   0.000   0.001       C1
    #> X1225   0.000   0.000   1.000       C3
    #> X1338   0.000   0.000   1.000       C3
    #> X1340   0.999   0.000   0.001       C1
    #> X1308   0.995   0.000   0.005       C1
    #> X1278   0.965   0.033   0.002       C1
    #> X1314   0.932   0.067   0.001       C1
    #> X1102   0.997   0.000   0.003       C1
    #> X1168   0.999   0.000   0.001       C1
    #> X1115   0.636   0.357   0.007       C1
    #> X1167   0.029   0.000   0.971       C3
    #> X1203   0.759   0.205   0.036       C1
    #> X1163   0.997   0.001   0.002       C1
    #> X1156   0.999   0.000   0.001       C1
    #> X1280   0.968   0.009   0.023       C1
    #> X1334   0.898   0.079   0.023       C1
    #> X1233   0.662   0.330   0.008       C1
    #> X1118   0.143   0.150   0.707       C3
    #> X1108   0.999   0.000   0.001       C1
    #> X1100   0.550   0.438   0.012       C1
    #> X1132   0.148   0.008   0.844       C3
    #> X1180   0.931   0.041   0.028       C1
    #> X1277   0.208   0.123   0.669       C3
    #> X1259   0.883   0.116   0.001       C1
    #> X1220   0.658   0.304   0.038       C1
    #> X1221   0.917   0.059   0.024       C1
    #> X1276   0.763   0.231   0.006       C1
    #> X1352   0.995   0.000   0.005       C1
    #> X1208   0.611   0.383   0.006       C1
    #> X1120   0.934   0.046   0.020       C1
    #> X1235   0.761   0.224   0.015       C1
    #> X1183   0.193   0.803   0.004       C2
    #> X1279   0.970   0.020   0.010       C1
    #> X1138   0.100   0.893   0.007       C2
    #> X1204   0.785   0.211   0.004       C1
    #> X1252   0.425   0.550   0.025       C2
    #> X1246   0.438   0.562   0.000       C2
    #> X1197   0.034   0.965   0.001       C2
    #> X1238   0.186   0.810   0.004       C2
    #> X1213   0.030   0.969   0.001       C2
    #> X1141   0.735   0.258   0.007       C1
    #> X1164   0.304   0.690   0.006       C2
    #> X1172   0.280   0.701   0.019       C2
    #> X1188   0.158   0.842   0.000       C2
    #> X1309   0.819   0.154   0.027       C1
    #> X1097   0.967   0.020   0.013       C1
    #> X1330   0.000   1.000   0.000       C2
    #> X1332   0.058   0.942   0.000       C2
    #> X1266   0.992   0.001   0.007       C1
    #> X1257   0.560   0.432   0.008       C1
    #> X1174   0.007   0.993   0.000       C2
    #> X1123   0.063   0.001   0.936       C3
    #> X1207   0.997   0.000   0.003       C1
    #> X1143   0.980   0.020   0.000       C1
    #> X1344   0.337   0.656   0.007       C2
    #> X1322   0.409   0.571   0.020       C2
    #> X1169   0.953   0.039   0.008       C1
    #> X1268   0.702   0.294   0.004       C1
    #> X1243   0.001   0.999   0.000       C2
    #> X1222   0.540   0.425   0.035       C1
    #> X1144   0.003   0.997   0.000       C2
    #> X1122   0.600   0.396   0.004       C1
    #> X1145   0.071   0.927   0.002       C2
    #> X1147   0.001   0.999   0.000       C2
    #> X1153   0.349   0.648   0.003       C2
    #> X1158   0.464   0.523   0.013       C2
    #> X1294   0.395   0.571   0.034       C2
    #> X1296   0.164   0.832   0.004       C2
    #> X1245   0.938   0.061   0.001       C1
    #> X1306   0.631   0.360   0.009       C1
    #> X1194   0.617   0.378   0.005       C1
    #> X1256   0.852   0.136   0.012       C1
    #> X1195   0.046   0.615   0.339       C2
    #> X1212   0.434   0.562   0.004       C2
    #> X1217   0.239   0.756   0.005       C2
    #> X1215   0.752   0.227   0.021       C1
    #> X1196   0.031   0.968   0.001       C2
    #> X1198   0.954   0.022   0.024       C1
    #> X1318   0.006   0.994   0.000       C2
    #> X1231   0.476   0.515   0.009       C2
    #> X1249   0.692   0.307   0.001       C1
    #> X1288   0.067   0.932   0.001       C2
    #> X1244   0.774   0.210   0.016       C1
    #> X1292   0.649   0.344   0.007       C1
    #> X1267   0.403   0.561   0.036       C2
    #> X1162   0.476   0.493   0.031       C2
    #> X1272   0.457   0.511   0.032       C2
    #> X1166   0.107   0.881   0.012       C2
    #> X1232   0.629   0.362   0.009       C1
    #> X1274   0.449   0.513   0.038       C2
    #> X1282   0.293   0.674   0.033       C2
    #> X1112   0.408   0.582   0.010       C2
    #> X1113   0.349   0.631   0.020       C2
    #> X1190   0.106   0.884   0.010       C2
    #> X1129   0.085   0.913   0.002       C2
    #> X1205   0.658   0.313   0.029       C1
    #> X1209   0.048   0.950   0.002       C2
    #> X1134   0.468   0.524   0.008       C2
    #> X1179   0.099   0.901   0.000       C2
    #> X1242   0.369   0.604   0.027       C2
    #> X1214   0.166   0.830   0.004       C2
    #> X1219   0.483   0.506   0.011       C2
    #> X1228   0.216   0.772   0.012       C2
    #> X1320   0.941   0.058   0.001       C1
    #> X1247   0.000   1.000   0.000       C2
    #> X1251   0.061   0.937   0.002       C2
    #> X1324   0.026   0.973   0.001       C2
    #> X1148   0.000   1.000   0.000       C2
    #> X1189   0.364   0.627   0.009       C2
    #> X1356   0.292   0.702   0.006       C2
    #> X1286   0.023   0.976   0.001       C2
    #> X1310   0.930   0.069   0.001       C1
    #> X1098   0.158   0.842   0.000       C2
    #> X1342   0.624   0.370   0.006       C1
    #> X1275   0.027   0.972   0.001       C2
    #> X1229   0.572   0.415   0.013       C1
    #> X1346   0.000   1.000   0.000       C2
    #> X1348   0.283   0.699   0.018       C2
    #> X1350   0.000   1.000   0.000       C2
    #> X1248   0.000   1.000   0.000       C2
    #> X1092   0.167   0.830   0.003       C2
    #> X1285   0.001   0.999   0.000       C2
    #> X1299   0.041   0.957   0.002       C2
    #> X1328   0.144   0.852   0.004       C2
    #> X1336   0.260   0.734   0.006       C2
    #> X1139   0.064   0.928   0.008       C2
    #> X1173   0.202   0.795   0.003       C2
    #> X1157   0.054   0.938   0.008       C2
    #> X1260   0.000   1.000   0.000       C2
    #> X1358   0.336   0.654   0.010       C2
    #> X1303   0.152   0.844   0.004       C2
    #> X1101   0.114   0.001   0.885       C3
    #> X1109   0.379   0.611   0.010       C2
    #> X1114   0.372   0.592   0.036       C2
    #> X1270   0.076   0.900   0.024       C2
    #> X1304   0.673   0.315   0.012       C1
    #> X1230   0.308   0.683   0.009       C2
    #> X1192   0.934   0.042   0.024       C1
    #> X1182   0.595   0.398   0.007       C1
    #> X1133   0.116   0.879   0.005       C2
    #> X1184   0.314   0.670   0.016       C2
    #> X1202   0.683   0.307   0.010       C1
    #> X1171   0.337   0.651   0.012       C2
    #> X1218   0.305   0.663   0.032       C2
    #> X1187   0.070   0.923   0.007       C2
    #> X1291   0.831   0.158   0.011       C1
    #> X1090   0.145   0.854   0.001       C2
    #> X1226   0.267   0.721   0.012       C2
    #> 
    #> $heatmap

## Questions?

If you have any questions, please feel free to contact
(<diego.fedreira@udc.es>).
