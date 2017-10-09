import matplotlib.pyplot as plt
"""
#-----------poly---------------------------------------------------
poly_x = [3, 5, 15, 18, 20, 22]
poly_iters = [256, 474, 4977, 30000, 30000, 30000]
poly_train_errors = [0, 0, 0, 0.0133, 0.0267, 0.0267]
poly_test_errors = [0.0333, 0.0333, 0.0533, 0.0333, 0.0400, 0.0533]
poly_miss_class = [39, 37, 31, 37, 42, 40]

#plot train_errors and test_errors
fig_poly_train_test, sub_plot_poly_train_test = plt.subplots()
poly_train = sub_plot_poly_train_test.scatter(poly_x, poly_train_errors)
poly_test = sub_plot_poly_train_test.scatter(poly_x, poly_test_errors)
sub_plot_poly_train_test.plot(poly_x, poly_train_errors)
sub_plot_poly_train_test.plot(poly_x, poly_test_errors)

sub_plot_poly_train_test.legend((poly_train, poly_test),\
                                ('Training Errors', 'Test Errors'),\
                                scatterpoints=1, loc='lower left',
                                ncol=3,
                                fontsize=8)

#-----------------plot_miss_classification-------------------------
fig_miss_class, sub_plot_miss_class = plt.subplots()
sub_plot_miss_class.scatter(poly_x, poly_miss_class)
sub_plot_miss_class.plot(poly_x, poly_miss_class)
sub_plot_poly_train_test.legend((poly_miss_class),\
                                 ('misclassifications'),\
                                 scatterpoints=1, loc='lower left',
                                 ncol=3,
                                 fontsize=8)
#---------------end_plot_miss_classification-----------------------
#--------------end_poly--------------------------------------------
"""
"""
#----------------radial_basis--------------------------------------

radial_x = [0.1, 0.5, 1, 1.5, 2.5]
radial_train_errors = [0, 0, 0, 0, 0]
radial_test_errors = [0.0133, 0.0133, 0.0200, 0.0200, 0.0267]

fig_radial_train_test, sub_plot_radial_train_test = plt.subplots()
radial_train = sub_plot_radial_train_test.scatter(radial_x, radial_train_errors)
radial_test = sub_plot_radial_train_test.scatter(radial_x, radial_test_errors)
sub_plot_radial_train_test.plot(radial_x, radial_train_errors)
sub_plot_radial_train_test.plot(radial_x, radial_test_errors)

sub_plot_radial_train_test.legend((radial_train, radial_test),\
                                ('Radial Basis Training Errors',\
                                 'Radial Basis Test Errors'),\
                                scatterpoints=1, loc='lower left',
                                ncol=3,
                                fontsize=8)
#--------------end_radial_basis--------------------------------------------
"""
"""
#--------------2.8.2-------------------------------------------------------
#with sigma=2--------------------------------------------------------------
sigma_2_x = [7, 8, 10, 14, 16, 20, 32, 40]
test_errors = [0.1111, 0.1611, 0.1333, 0.0500, 0.0444, 0.0611, 0.0389, 0.0611]
train_errors = [0.1222, 0.1611, 0.0722, 0.0111, 0.0167, 0.0056, 0.0056, 0.0111]
fig_sigma_2, sub_plot_sigma_2 = plt.subplots()
sigma_2_test = sub_plot_sigma_2.scatter(sigma_2_x, test_errors)
sigma_2_train = sub_plot_sigma_2.scatter(sigma_2_x, train_errors)
sub_plot_sigma_2.plot(sigma_2_x, test_errors)
sub_plot_sigma_2.plot(sigma_2_x, train_errors)
sub_plot_sigma_2.legend((sigma_2_test, sigma_2_train),\
                        ('Test Errors', 'Training Errors'),\
                        scatterpoints=1, loc='lower left',
                        ncol=3,
                        fontsize=8)
"""
"""
#with sigma=3--------------------------------------------------------------
sigma_3_x = [7, 8, 10, 14, 16, 20, 32, 40]
test_errors = [0.1222, 0.2222, 0.1778, 0.1333, 0.1222, 0.1389, 0.0778, 0.1222]
train_errors = [0.1278, 0.1778, 0.1000, 0.0944, 0.0833, 0.0222, 0.0167, 0.0167]
fig_sigma_3, sub_plot_sigma_3 = plt.subplots()
sigma_3_test = sub_plot_sigma_3.scatter(sigma_3_x, test_errors)
sigma_3_train = sub_plot_sigma_3.scatter(sigma_3_x, train_errors)
sub_plot_sigma_3.plot(sigma_3_x, test_errors)
sub_plot_sigma_3.plot(sigma_3_x, train_errors)
sub_plot_sigma_3.legend((sigma_3_test, sigma_3_train),\
                        ('Test Errors', 'Training Errors'),\
                        scatterpoints=1, loc='lower left',
                        ncol=3,
                        fontsize=8)
"""
#with sigma=4--------------------------------------------------------------
sigma_4_x = [7, 8, 10, 14, 16, 20, 32, 40]
test_errors = [0.1611, 0.2000, 0.2111, 0.2389, 0.1833, 0.1444, 0.1389, 0.1500]
train_errors = [0.1444, 0.1500, 0.1111, 0.1167, 0.1389, 0.0500, 0.0333, 0.0278]
fig_sigma_4, sub_plot_sigma_4 = plt.subplots()
sigma_4_test = sub_plot_sigma_4.scatter(sigma_4_x, test_errors)
sigma_4_train = sub_plot_sigma_4.scatter(sigma_4_x, train_errors)
sub_plot_sigma_4.plot(sigma_4_x, test_errors)
sub_plot_sigma_4.plot(sigma_4_x, train_errors)
sub_plot_sigma_4.legend((sigma_4_test, sigma_4_train),\
                        ('Test Errors', 'Training Errors'),\
                        scatterpoints=1, loc='lower left',
                        ncol=3,
                        fontsize=8)
#--------------end_2.8.2---------------------------------------------------
plt.show()
