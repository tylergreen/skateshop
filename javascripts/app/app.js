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
  $scope.myslides = [{image: '../../skate-images/pool-crusher-deepend-wilson.jpg', text: 'Pool King Pool Crusher'},
					{image: '../../skate-images/powerstation-hyperkick.jpg', text: 'Adventures with the Pool King Crown Hyper Kick'}
];
	
};



// App.constant('decksUrl', 'https://greent.firebaseio.com/skateshop/products/decks');
App.constant('decksUrl', 'https://greent.firebaseio.com/mydecks');

function DeckCtrl($scope, angularFire, decksUrl){
	var promise = angularFire(decksUrl, $scope, 'deckList', []);
	
	$scope.imageDetail = function(deck){
		$scope.deckDetail = deck;
	}


}

