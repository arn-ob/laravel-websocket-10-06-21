<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Events\NewChatMessage;
use App\Events\OrderShipped;


class MessageController extends Controller
{
    public function broadcast(Request $request) {

        if (! $request->filled('message')) {
            return response()->json(['message' => 'No message to send'], 422);
        }

        event(new NewChatMessage($request->message, $request->user));  // Public Channel
        // event(new OrderShipped($request->message, $request->user)); // Private Channel

        return response()->json(["broadcast" => "true"], 200);
    }
}