var app = angular.module('MyApp', []);
app.controller('myCtrl', function($scope, $sce) {
    $scope.userInput = 'foo';

    $scope.sayHello = function() {
     // ruleid:detect-angular-open-redirect
     $window.location.href = input + '/app/logout';
     input = $scope.input;
     // ruleid:detect-angular-open-redirect
     $window.location.href = input + '/app/logout';

     //Data is not coming from user input
     $location.location.location = test
     // ok:detect-angular-open-redirect
     $window.location.href = "//untatintedredirect"
   };

});
