module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    copy:
      main:
        files: [
          {
            expand: true
            flatten: true
            src: [
              'assets/components/jquery/dist/jquery.min.js'
              'assets/components/require.js/build/require.min.js'
              'assets/components/bootstrap/dist/js/bootstrap.min.js'
            ]
            dest: 'assets/dist/lib/'
          }
        ]

    styl:
      compile:
        options:
          whitespace: true
        files:
          'assets/dist/css/main.css': 'assets/src/styl/main.styl'

    watch:
      gruntfile:
        files: 'Gruntfile.coffee'
        tasks: ['jshint:gruntfile']
      scripts:
        files: []
        tasks: []
      css:
        files: ['assets/src/styl/**/*.styl']
        task: ['styl']


  grunt.loadNpmTasks 'grunt-styl'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['styl', 'watch:css']

  grunt.registerTask 'jshint:gruntfile'
