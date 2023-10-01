// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import {corsHeaders} from "../_shared/cors.ts";


serve(async (req) => {

  if (req.method === 'OPTIONS') {
    return new Response('ok', {headers: corsHeaders})
  }

  try{
    const supabaseClient = createClient(
        'https://rftvbsvcljemoonofdhk.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
        // Create client with AuthPage context of the user that called the function.
        // This way your row-level-security (RLS) policies are applied.
        {global: {headers: {Authorization: req.headers.get('Authorization')!}}}
    )

    const { id, first_name, last_name, model, color, car_number} = await req.json()

    const {data, error} = await supabaseClient.from('drivers')
        .update({ first_name: first_name, last_name: last_name, model: model, color: color, car_number: car_number })
        .eq('id', id)
        .select('*')
    if (error) throw error

    return new Response(JSON.stringify({data}), {
      headers: {...corsHeaders, 'Content-Type': 'application/json'},
      status: 200,
    })


  } catch (error) {
    return new Response(JSON.stringify({error: error.message}), {
      headers: {
        ...corsHeaders,
        'Content-Type': 'application/json',
        'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8'
      },
      status: 400,
    })
  }

}).then()

// To invoke:
// curl -i --location --request POST 'http://localhost:54321/functions/v1/' \
//   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
//   --header 'Content-Type: application/json' \
//   --data '{"name":"Functions"}'
