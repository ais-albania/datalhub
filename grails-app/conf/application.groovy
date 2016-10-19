// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'al.data.catalog.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'al.data.catalog.UserRole'
grails.plugin.springsecurity.authority.className = 'al.data.catalog.Role'

//Disable pessimistic locking
grails.plugin.springsecurity.rejectIfNoRule = false
grails.plugin.springsecurity.fii.rejectPublicInvocations = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
		[pattern: '/',               access: ['permitAll']],
		[pattern: '/error',          access: ['permitAll']],
		[pattern: '/index',          access: ['permitAll']],
        [pattern: '/upload/**',          access: ['permitAll']],
		[pattern: '/c/**',          access: ['permitAll']],
		[pattern: '/data_**',          access: ['permitAll']],
		[pattern: '/data',          access: ['permitAll']],
        [pattern: '/register/register/**',  access: ['permitAll']],
        [pattern: '/securityInfo/index/**',  access: ['permitAll']],
		[pattern: '/index.gsp',      access: ['permitAll']],
		[pattern: '/shutdown',       access: ['permitAll']],
		[pattern: '/assets/**',      access: ['permitAll']],
		[pattern: '/**/js/**',       access: ['permitAll']],
		[pattern: '/**/css/**',      access: ['permitAll']],
		[pattern: '/**/images/**',   access: ['permitAll']],
		[pattern: '/img/**',         access: ['permitAll']],
		[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
		[pattern: '/assets/**',      filters: 'none'],
		[pattern: '/**/js/**',       filters: 'none'],
		[pattern: '/**/css/**',      filters: 'none'],
		[pattern: '/**/images/**',   filters: 'none'],
		[pattern: '/**/favicon.ico', filters: 'none'],
		[pattern: '/**',             filters: 'JOINED_FILTERS']
]


grails.plugin.springsecurity.logout.postOnly = false
al.data.catalog.upload.path = ""
al.data.catalog.rssFeed.title= "AIS Latest"
al.data.catalog.rssFeed.url="http://ais.al/new/en/feed/"
al.data.catalog.parentFeed.title="ODA Latest"
al.data.catalog.parentFeed.url="http://feeds.feedburner.com/OpenDataAlbaniaFeed"
al.data.catalog.publicUrl = "https://hub.data.al"
al.data.catalog.site.name= "Hub Data Albania"


