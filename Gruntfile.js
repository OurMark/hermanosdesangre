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

    // image optimization task
    imagemin: {
      dynamic: {
       files: [{
         expand: true,
         cwd: 'app/assets/images/',
         src: ['**/*.{png,jpg,svg}'],
         dest: 'app/assets/images/'
       }]
      }
    },

    // files clean task
    clean: [
      'app/assets/javascripts/hermanos.concat.js'
    ],

    // js concatenation
    concat: {
      dist: {
        src: ['app/assets/javascripts/app/*.js'],
        dest: 'app/assets/javascripts/hermanos.concat.js',
      }
    },

    // js minification
    uglify: {
      hemanosjs: {
        files: {
          'app/assets/javascripts/hermanos.min.js': ['app/assets/javascripts/hermanos.concat.js']
        }
      }
    },

    // js validations task
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: [
        'Gruntfile.js',
        '<%= global_vars.base_path %>' + '<%= global_vars.js %>' + '/app/*.js'
      ]
    },

    //sass compilation
    compass: {
      dist: {
        options: {
          sassDir: 'app/assets/sass',
          cssDir: 'app/assets/stylesheets',
          environment: 'development'
        }
      }
    },

    // grunt watch task
    watch: {

      grunt: {
        files: ['Gruntfile.js']
      },

      sass: {
        files: [
          '<%= global_vars.base_path %>' + '<%= global_vars.sass %>' + '/**/*.scss'
        ],
        tasks: ['compass']
      },

      js: {
        files: [
          '<%= jshint.all %>'
        ],
        tasks: ['jshint']
      }
    },
  });

  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.registerTask('default', ['jshint', 'concat', 'uglify', 'clean', 'watch']);
  grunt.registerTask('sass', ['compass']); //sass files compilation task
  grunt.registerTask('image', ['imagemin']); //image optimization task
};
