import type {NextConfig} from 'next';

const nextConfig: NextConfig = {
    images: {
        remotePatterns: [
            {
                protocol: 'https',
                hostname: 'static-cdn.jtvnw.net',
                port: '',
                pathname: '/jtv_user_pictures/**'
            }
        ]
    }
};

export default nextConfig;
