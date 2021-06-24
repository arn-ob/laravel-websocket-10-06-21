<?php

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Models\ChatMessage;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

// Type 1
// Broadcast::channel('chatuser.{chatMessage}', function ($user, $chatMessage) {
//     if(Auth::check()){
//         error_log($user->id);
//         error_log($user->name);
//         return [ 'id'=>$user->id, 'name'=>$user->name ];
//     }
// });

Broadcast::channel('chatuser.{chatMessage}', function ($user, $chatMessage) {
    Log::error($user);
    return $user;
});
