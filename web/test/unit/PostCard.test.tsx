import { render, screen } from '@testing-library/react';
import PostCard from '../../components/PostCard';

test('renders PostCard component without crashing', () => {
const mockProps = {
    headerImage: 'testImage.jpg',
    author: 'Test Author',
    date: 'Test Date',
    role: 'Test Role',
    title: 'Test Title',
    content: 'Test Content',
    tags: ['tag1', 'tag2'],
};

render(<PostCard {...mockProps} />);

expect(screen.getByText(mockProps.author)).toBeInTheDocument();
expect(screen.getByText(mockProps.date)).toBeInTheDocument();
expect(screen.getByText(mockProps.role)).toBeInTheDocument();
expect(screen.getByText(mockProps.title)).toBeInTheDocument();
expect(screen.getByText(mockProps.content)).toBeInTheDocument();
});