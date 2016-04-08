package MyApp;
use common::sense;
use parent 'Mojolicious';

sub startup {
    my $app = shift;

    $app->plugin('xslate_renderer');

    my $routes = $app->routes;

    $routes->get('/')->name('root')->to('my_controller#get_root');

    $routes->post('/')->to('my_controller#post_root');
}

1;
