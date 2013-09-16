function partials(file){
	return 'javascripts/app/partials/' + file
}


var App = angular.module('App', ['firebase', 'ui.bootstrap']).
	config(['$routeProvider', function($routeProvider){
				$routeProvider.
					when('/', { templateUrl: partials('home.html'), controller: HomeCtrl } ).
					when('/decks', {templateUrl: partials('decks.html'),  controller: DeckCtrl } ).
					otherwise({ redirectTo: '/' });
			}
			
]);

function HomeCtrl($scope) {
  $scope.myInterval = 6000;
  var slides = $scope.slides = [];
  $scope.addSlide = function() {
	  
    var newWidth = 200 + ((slides.length + (25 * slides.length)) % 150);
    slides.push({
      image: 'http://placekitten.com/' + newWidth + '/200',
      text: ['More','Extra','Lots of','Surplus'][slides.length % 4] + ' ' +
        ['Cats', 'Kittys', 'Felines', 'Cutes'][slides.length % 4]
    });
  };
  for (var i=0; i<4; i++) {
    $scope.addSlide();
  }
};



// App.constant('decksUrl', 'https://greent.firebaseio.com/skateshop/products/decks');
App.constant('decksUrl', 'https://greent.firebaseio.com/mydecks');

function DeckCtrl($scope, angularFire, decksUrl){
	var promise = angularFire(decksUrl, $scope, 'deckList', []);
}

