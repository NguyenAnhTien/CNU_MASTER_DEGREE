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
plt.show()
