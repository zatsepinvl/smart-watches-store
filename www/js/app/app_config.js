var app = angular.module('app', [
    'ngResource',
    'ngSanitize',
    'ui.router',
    'ngAnimate',
    'ngCookies'
]);

String.prototype.replaceAll = function (search, replace) {
    return this.split(search).join(replace);
};


app.config(function ($locationProvider, $httpProvider, $stateProvider, $urlRouterProvider) {
        $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
        $urlRouterProvider.otherwise('/');
        $stateProvider
            .state('index', {
                abstract: true,
                templateUrl: 'index.html'
            })
            .state('admin', {
                url: '/admin',
                templateUrl: 'admin.html',
                controller: 'AdminCtrl',
                resolve: {
                    orders: function (Entity) {
                        return Entity.query({entity: 'order'}, function (orders) {
                            orders.forEach(function (order) {
                                console.log(order.time);
                                order.time = moment.utc(order.time).local();
                                order.items = JSON.parse(order.items);
                                var items = '<ul>';
                                order.items.forEach(function (item) {
                                    items += '<li>' + item.name + '</li>';
                                });
                                items += '</ul>';
                                order.textItems = items;
                            })
                        });
                    }
                }
            })
            .state('main', {
                abstract: true,
                parent: 'index',
                templateUrl: 'main/main.html',
                controller: 'MainCtrl',
                resolve: {
                    cart: function (CartService) {
                        CartService.init();
                    }
                }
            })
            .state('main.home',
                {
                    url: '/',
                    templateUrl: 'main/home.html',
                    controller: 'HomeCtrl'
                })
            .state('main.catalog',
                {
                    url: '/catalog',
                    templateUrl: 'main/catalog.html',
                    controller: 'CatalogCtrl',
                    resolve: {
                        items: function (Entity) {
                            return Entity.query({entity: 'item'});
                        }
                    }
                })
            .state('main.cart',
                {
                    url: '/cart',
                    templateUrl: 'main/cart.html',
                    controller: 'CartCtrl'
                })
            .state('main.item',
                {
                    url: '/item/{itemId}',
                    templateUrl: 'main/item.html',
                    controller: 'ItemCtrl',
                    resolve: {
                        item: function (Entity, $stateParams) {
                            return Entity.get({entity: 'item', id: $stateParams.itemId});
                        }
                    }
                });
        $locationProvider.html5Mode(true);
    }
);


app.service('CartService', function ($cookies) {
    var order = {items: []};

    this.init = function () {
        var orderTemp = $cookies.get('order');
        if (orderTemp) {
            clone(JSON.parse(orderTemp), order);
        }
    };

    this.order = order;
    this.save = function () {
        var now = new Date();
        $cookies.put('order', '' + JSON.stringify(order));//, {expires: new Date(new Date().setHours(now.getHours() + 24))});
    };
    this.clear = function () {
        $cookies.remove('order');
    }


})
;

app.factory('Entity', function ($resource) {
    return $resource('/api/:entity/:id', {
        entity: '@entity',
        id: '@id'
    }, {
        'update': {
            method: 'PUT'
        }
    });
});

app.controller('MainCtrl', function ($scope, $location, $state) {
    $scope.getClass = function (path) {
        return ($location.path() === path) ? 'active' : '';
    };
    $scope.goState = function (state, args) {
        $state.go(state, args);
    };
});

app.controller('HomeCtrl', function ($scope, Entity) {
    $scope.heading = 'Home';
    $scope.items = [];
    $scope.temps = Entity.query({entity: 'item'},
        function () {
            for (var i = 0; i < 3; i++) {
                var temp = $scope.temps[Math.floor(Math.random() * $scope.temps.length)];
                if ($scope.items.indexOf(temp) == -1) {
                    $scope.items.push(temp);
                }
                else {
                    i--;
                }
            }
        }
    );
});

app.controller('CatalogCtrl', function ($scope, items) {
    $scope.heading = 'Catalog';
    $scope.items = items;
    $scope.isActive = function (id) {
        return $scope.temp.manufacturer_id == id ? 'active' : '';
    };
    $scope.temp = {manufacturer_id: 0};
});


app.controller('AdminCtrl', function ($scope, orders) {
    $scope.orders = orders;
});

app.controller('ItemCtrl', function ($scope, item, CartService) {
    $scope.item = item;
    $scope.putInCart = function () {
        var order = CartService.order;
        order.items.push(item);
        CartService.save();
    }
});

app.controller('CartCtrl', function ($scope, CartService, Entity) {
    $scope.order = CartService.order;
    $scope.order.total = 0;
    $scope.remove = function (item) {
        var index = $scope.order.items.indexOf(item);
        $scope.order.items.splice(index, 1);
        countTotal();
        CartService.save();
    };
    var countTotal = function () {
        $scope.order.total = 0;
        for (var i = 0; i < $scope.order.items.length; i++) {
            $scope.order.total += parseInt($scope.order.items[i].price);
        }
    };

    countTotal();


});
app.controller('CartFormCtrl', function ($scope, Entity, CartService) {
    $scope.submit = function () {
        var order = {};
        clone($scope.order, order);
        order.items = '' + JSON.stringify(order.items);
        order.time = moment().utc();
        console.log(order);
        Entity.save({entity: 'order'}, order, function () {
            $scope.order.items = [];
            $scope.order.ordered = true;
            CartService.clear();
        });
    }
});
function clone(from, to) {
    for (var k in from) to[k] = from[k];
}


