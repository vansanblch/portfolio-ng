"""Add users

Revision ID: 5785af2367e
Revises: 260d66566ebc
Create Date: 2013-05-06 15:24:44.453817

"""

# revision identifiers, used by Alembic.
revision = '5785af2367e'
down_revision = '260d66566ebc'

from alembic import op
import sqlalchemy as sa


def upgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.create_table('users',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('email', sa.String(length=128), nullable=True),
    sa.Column('role', sa.String(length=128), nullable=True),
    sa.PrimaryKeyConstraint('id'),
    sa.UniqueConstraint('role')
    )
    ### end Alembic commands ###


def downgrade():
    ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('users')
    ### end Alembic commands ###