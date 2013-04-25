'use strict'

# Menu contraller
MenuCtrl = ($scope, Menu) ->
    $scope.tree = Menu.getTree()

MenuCtrl.$inject = ['$scope', 'Menu']
angular.module('portfolioNgApp').controller 'MenuCtrl', MenuCtrl


# Edit menu controller
MenuEditCtrl = ($scope, $route, Menu) ->
    #menuId = $route.current.params.menuId
    #$scope.menu = Menu.getMenu()

    #$scope.save = ->
        #Menu.updateItem($scope.menu)

MenuEditCtrl.$inject = ['$scope', '$route', 'Menu']
angular.module('portfolioNgApp').controller 'MenuEditCtrl', MenuEditCtrl

# List menu's cards
CardListCtrl = ($scope, $routeParams, Menu) ->
    menuId = parseInt $routeParams.menuId, 10

    $scope.menu = Menu.currentMenu

    currentIndex = 0;
    total = false

    cards = Menu.getCards menuId, (cards) ->
        total = cards.length - 1
        $scope.card = cards[currentIndex]

    $scope.isLinkDisabled = (direction) ->
        result = false
        if direction is 'previous' and currentIndex is 0
            result = true

        if direction is 'next' and currentIndex is total
            result = true

        result

    $scope.showNext = ->
        if currentIndex < total
            console.log 'showNext', currentIndex, total
            $scope.card = cards[++currentIndex]

    $scope.showPrevious = ->
        if currentIndex > 0
            console.log 'showPrevious', currentIndex, total
            $scope.card = cards[--currentIndex]

    Menu.onMenuLoaded $scope, (menu) ->
        angular.forEach menu, (item) ->
            if item.id is menuId
                $scope.menu = item

CardListCtrl.$inject = ['$scope', '$routeParams', 'Menu']
angular.module('portfolioNgApp').controller 'CardListCtrl', CardListCtrl
