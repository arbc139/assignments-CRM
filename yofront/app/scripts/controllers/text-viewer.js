'use strict';

/**
 * @ngdoc function
 * @name dbfrontappApp.controller:TextViewerCtrl
 * @description
 * # TextViewerCtrl
 * Controller of the dbfrontappApp
 */
angular.module('dbfrontappApp')
  .controller('TextViewerCtrl', function ($scope, CacheService, FileService) {
    this.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];

    $scope.txt = CacheService.getCache();
    CacheService.clearCache();

    $scope.download = function() {
      FileService.downloadAsCsv($scope.txt);
    };

  });