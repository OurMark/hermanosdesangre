module.exports = function(grunt) {
  require('load-grunt-tasks')(grunt);

  var base_path = 'app/assets/';

  var global_vars = {
    js: 'javascripts',
    sass: 'sass',
    css: 'stylesheets',
    base_path:  base_path
  };

  grunt.initConfig({
    global_vars: global_vars,
    pkg: grunt.file.readJSON('package.json'),

    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: [
        'Gruntfile.js',
        '<%= global_vars.base_path %>' + '<%= global_vars.js %>' + '/**/*.js'
      ]
    },

    watch: {
      grunt: { files: ['Gruntfile.js'] },

      js: {
        files: [
          '<%= jshint.all %>'
        ],
        tasks: ['jshint']
      }
    },
  });

  grunt.registerTask('default', ['jshint', 'watch']);
};
