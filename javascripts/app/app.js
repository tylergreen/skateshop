function partials(file){
	return 'javascripts/app/partials/' + file
}

var App = angular.module('App', ['firebase', 'ui.bootstrap']).
	config(['$routeProvider', function($routeProvider){
				$routeProvider.
					when('/', { templateUrl: partials('home.html'), controller: HomeCtrl } ).
					when('/decks', {templateUrl: partials('decks.html'),  controller: DeckCtrl } ).
					when('/cart', {templateUrl: partials('cart.html'),  controller: CartCtrl } ).
					otherwise({ redirectTo: '/' });
			}
			
]);

App.factory("shoppingCart", function() {
	var items = [];
	return {
		contents: function(){
			return items;
		},
		addToCart: function(product){
			items.push(product);
		},
		total: function(){
				return items.reduce(
					function(sum, product) {
						return sum + parseFloat(product.price)
					}, 0);
		}
	};
});


function HomeCtrl($scope) {
  $scope.myInterval = 6000;
  $scope.myslides = [{image: '../../skate-images/pool-crusher-deepend-wilson.jpg', text: 'Pool King Pool Crusher'},
					{image: '../../skate-images/powerstation-hyperkick.jpg', text: 'Adventures with the Pool King Crown Hyper Kick'},
					 {image: '../../skate-images/tony-alva-dogstar-stubbie.png', text: 'Tony Alva Dogstar Stubbie' }

];
	
};


// App.constant('decksUrl', 'https://greent.firebaseio.com/skateshop/products/decks');
App.constant('decksUrl', 'https://greent.firebaseio.com/mydecks');
App.constant('trucksUrl', 'https://greent.firebaseio.com/trucks');
App.constant('wheelsUrl', 'https://greent.firebaseio.com/wheels');

function DeckCtrl($scope, angularFire, decksUrl, shoppingCart){
	var promise = angularFire(decksUrl, $scope, 'deckList', []);
	
	$scope.imageDetail = function(deck){
		$scope.deckDetail = deck;
	};
	
	$scope.addToCart = shoppingCart.addToCart;
};

function CartCtrl($scope, shoppingCart){
	$scope.contents = shoppingCart.contents();
	$scope.total = shoppingCart.total();
}
