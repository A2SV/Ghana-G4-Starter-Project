import React from 'react'
import SingleBlog from '@/components/SingleBlog'
import Footer from '@/components/Footer'
import Header from '@/components/Header'

const page = () => {
  return (
    <div>
        <Header />
        <SingleBlog />
        <Footer />
    </div>
  )
}

export default page