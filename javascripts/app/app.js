function partials(file){
	return 'javascripts/app/partials/' + file
}


var App = angular.module('App', ['firebase']).
	config(['$routeProvider', function($routeProvider){
				$routeProvider.
					when('/', { templateUrl: partials('home.html'), controller: HomeCtrl } ).
					when('/decks', {templateUrl: partials('decks.html'),  controller: DeckCtrl } ).
					otherwise({ redirectTo: '/' });
			}
			
]);

function HomeCtrl($scope){
}

// App.constant('decksUrl', 'https://greent.firebaseio.com/skateshop/products/decks');
App.constant('decksUrl', 'https://greent.firebaseio.com/mydecks');

function DeckCtrl($scope, angularFire, decksUrl){
	var promise = angularFire(decksUrl, $scope, 'deckList', []);
}

