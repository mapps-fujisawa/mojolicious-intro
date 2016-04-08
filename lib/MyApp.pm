package MyApp;
use common::sense;
use parent 'Mojolicious';

sub startup {
    my $app = shift;

    $app->plugin('xslate_renderer');
    $app->plugin('JSON::XS');

    my $routes = $app->routes;

    $routes->get('/')->name('root')->to('my_controller#get_root');

    $routes->get('/json')->name('json')->to('my_controller#get_json');

    $routes->post('/')->to('my_controller#post_root');
}

1;
