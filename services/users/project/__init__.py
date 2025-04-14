# services/users/project/__init__.py


import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_debugtoolbar import DebugToolbarExtension
from flask_cors import CORS
from flask_migrate import Migrate
from flask_caching import Cache


# instantiate the extensions
db = SQLAlchemy()
toolbar = DebugToolbarExtension()
cors = CORS(app=None)
migrate = Migrate()
cache = Cache()


def create_app(script_info=None):

    # instantiate the app
    app = Flask(__name__)

    # set config
    app_settings = os.getenv('APP_SETTINGS', 'project.config.DevelopmentConfig')
    app.config.from_object(app_settings)

        # Config for Redis cache
    app.config['CACHE_TYPE'] = 'RedisCache'
    app.config['CACHE_REDIS_HOST'] = os.environ.get('REDIS_HOST', 'redis')
    app.config['CACHE_REDIS_PORT'] = os.environ.get('REDIS_PORT', 6379)
    app.config['CACHE_REDIS_DB'] = 0
    app.config['CACHE_DEFAULT_TIMEOUT'] = 300  # seconds

    # set up extensions
    db.init_app(app)
    migrate.init_app(app, db)
    toolbar.init_app(app)
    cors.init_app(app)
    cache.init_app(app)

    from project.api.models import User

    # register blueprints
    from project.api.users import users_blueprint
    app.register_blueprint(users_blueprint)



    # shell context for flask cli
    @app.shell_context_processor
    def ctx():
        return {'app': app, 'db': db, 'User': User}


    return app
