'use strict'

angular.module('portfolioNgApp')
    .directive 'niCard', [ ->
        template = """
        <div class="card">
            <h3 class="title">{{card.name}}</h3>
            <img src="http://placehold.it/600x480/&text={{card.name}}">
            <p class="about">{{card.about}}</p>
        </div>
        """
        niCard =
            restrict: 'M'
            replace: true
            template: template
            link: (scope, element, attrs) ->
                if scope.$last
                    Foundation.libs.orbit.init $('#cards-list'), {
                        bullets: off
                        slide_number: off
                    }
    ]

angular.module('portfolioNgApp')
    .directive 'niMenu', [ ->
        niMenu =
            template: """
                <ul>
                    <li data-ng-repeat="item in tree">
                        <!-- directive: ni-menu-item item -->
                    </li>
                </ul>
            """
            replace: true
            restrict: 'M'
            scope:
                tree: '=niMenu'
    ]

angular.module('portfolioNgApp')
    .directive 'niMenuItem', ['$compile', 'Menu', ($compile, Menu) ->
        selectMenuElement = (item) ->
            Menu.currentMenu = item

        linker = (scope, elm, attrs, ctrl) ->
            scope.select = selectMenuElement

            if scope.item.children.length
                childitem = $compile('<!-- directive: ni-menu item.children -->')(scope)
                elm.append childitem

        niMenuItem =
            restrict: 'M'
            replace: true
            template: '<span><a ng-href="#!/menu/{{item.id}}/cards" ng-click="select(item)">{{item.name}}</a></span>'
            link: linker

        niMenuItem
    ]
