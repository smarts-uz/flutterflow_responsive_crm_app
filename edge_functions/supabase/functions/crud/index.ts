// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from 'https://deno.land/std@0.177.0/http/server.ts'
import { createClient, SupabaseClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey',
  // 'apikey': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRlY3lpdGxsZWVtcGx6aW1xZWRxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ4MzkwNzcsImV4cCI6MjAxMDQxNTA3N30.-o7eoRQ6RHasA2CHVS1su2lcM9fAk0UbBsQhBmE33gM'
}

interface Driver {
  first_name: string
  last_name: string
  model: string
  color: string
  car_number: string
}

async function getDriver(supabaseClient: SupabaseClient, id: string) {
  const { data: driver, error } = await supabaseClient.from('drivers').select('*').eq('id', id)
  if (error) throw error

  return new Response(JSON.stringify({ driver }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    status: 200,
  })
}

async function getAllDrivers(supabaseClient: SupabaseClient) {
  const { data: drivers, error } = await supabaseClient.from('drivers').select('*')
  if (error) throw error

  return new Response(JSON.stringify({ drivers }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    status: 200,
  })
}

async function deleteDriver(supabaseClient: SupabaseClient, id: string) {
  const { error } = await supabaseClient.from('drivers').delete().eq('id', id)
  if (error) throw error

  return new Response(JSON.stringify({}), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    status: 200,
  })
}

async function updateDriver(supabaseClient: SupabaseClient, id: string, driver: Driver) {
  const { error } = await supabaseClient.from('drivers').update(driver).eq('id', id)
  if (error) throw error

  return new Response(JSON.stringify({ driver }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    status: 200,
  })
}

async function createDriver(supabaseClient: SupabaseClient, driver: Driver) {
  const { error } = await supabaseClient.from('tasks').insert(driver)
  if (error) throw error

  return new Response(JSON.stringify({ driver }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    status: 200,
  })
}

serve(async (req) => {
  const { url, method } = req

  // This is needed if you're planning to invoke your function from a browser.
  if (method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    // Create a Supabase client with the AuthPage context of the logged in user.
    const supabaseClient = createClient(
        'https://rftvbsvcljemoonofdhk.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8',
        {global: {headers: {Authorization: req.headers.get('Authorization')!}}}
    )

    // For more details on URLPattern, check https://developer.mozilla.org/en-US/docs/Web/API/URL_Pattern_API

    const taskPattern = new URLPattern({ pathname: '/restful-tasks/:id' })
    const matchingPath = taskPattern.exec(url)
    const id = matchingPath ? matchingPath.pathname.groups.id : null

    let driver = null
    if (method === 'POST' || method === 'PUT') {
      const body = await req.json()
      driver = body.driver
    }

    // call relevant method based on method and id
    switch (true) {
      case id && method === 'GET':
        return getDriver(supabaseClient, id as string)
      case id && method === 'PUT':
        return updateDriver(supabaseClient, id as string, driver)
      case id && method === 'DELETE':
        return deleteDriver(supabaseClient, id as string)
      case method === 'POST':
        return createDriver(supabaseClient, driver)
      case method === 'GET':
        return getAllDrivers(supabaseClient)
      default:
        return getAllDrivers(supabaseClient)
    }
  } catch (error) {
    console.error(error)

    return new Response(JSON.stringify({ error: error.message }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      status: 400,
    })
  }
})
